module PeopleHelper
  def people_list
    Person.all.sort_by(&:name).map do |person|
      link_to(h(person),find_person_path(h(person))) 
    end.to_sentence(words_connector: "|",last_word_connector: "|").html_safe
  end
end
