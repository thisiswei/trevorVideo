require 'net/http'

class Updater
  class << self
    def perform
      Person.all.each do |person|
        update(person)
      end                       
    end
    
    def update(person)
      update_youtube_videos(person)
      update_vimeo_videos(person)
    end

    private
      def update_youtube_videos(person)
        return if person.youtube_username.blank?

        limit = 50
        offset = 1
        latest = person.most_recent_video_with_source('youtube').try(:created_at)
        
        catch(:break) do
          loop do
            videos = get_youtube_videos(person,limit,offset)

            throw(:break) if videos.none?
            videos.each do |video|
              key   = video['group']['videoid']
              title = video['title']
              created_at = video['published']
              

              throw(:break) if (latest && latest >= created_at)
              person.favorites.create(key: key, title: title, created_at: created_at, source: 'youtube', thumbnail_url: "http://i.ytimg.com/vi/#{key}/mqdefault.jpg")
            end
            offset = offset + limit 
          end
        end 
      end
      
      def get_youtube_videos(person,limit,offset)
        url="http://gdata.youtube.com/feeds/api/users/#{person.youtube_username}/favorites?v=2&max-results=#{limit}&start-index=#{offset}&format=5"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri).body
        Hash.from_xml(response)['feed']['entry'] or []
      end

      def update_vimeo_videos(person)
        return if person.vimeo_username.blank?

        total_pages =3
        # we wan more vimeo! why just 3? why would you charge me

        latest = person.most_recent_video_with_source('vimeo').try(:created_at)
        
        catch(:break) do
          1.upto(total_pages) do |page|
            videos = get_vimeo_videos(person,page)
            throw(:break) if videos.none?
            videos.each do |video| 
              begin 
                data = [Marshal.dump(video)].pack 'm' #in case i need the url...other stuffs
                key = video['id']
                title = video['title']
                created_at = video['liked_on'] || video['upload_date']
                thumbnail_url = video['thumbnail_large']
                played = video['stats_number_of_plays'].to_i
                likes = video['stats_number_of_likes'].to_i 
                user_name =  video['user_name']
              rescue 
                next
              end

              

              throw(:break) if (latest and latest >= created_at) 
              person.favorites.create(key: key, title:title, created_at: created_at, source: 'vimeo', thumbnail_url: thumbnail_url, played: played, likes: likes,user_name: user_name,data: data)
            end
          end
        end 
      end
      
      def get_vimeo_videos(person,page)
        uri = URI.parse("http://vimeo.com/api/v2/#{person.vimeo_username}/likes.xml?page=#{page}")
        uri = URI.parse("http://vimeo.com/api/v2/channel/staffpicks/videos.xml") if person.id ==2
        response = Net::HTTP.get_response(uri).body
        videos = Hash.from_xml(response)['videos']
        (videos.blank?)? [] : videos['video']
      end
  end
end           
