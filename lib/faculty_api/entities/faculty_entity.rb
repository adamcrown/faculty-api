module FacultyAPI
  class FacultyEntity < Grape::Entity
    # expose(:recognitions) { |_, _| [] }
    expose(:website) { |person, _| person.personal_website }
    expose :slug
    expose(:titles) { |person, _| Array(person.titles) }
    expose :name
    # expose(:activities) { [] }
    expose :url do |person, _|
      "https://faculty.biola.edu/#{person.slug}"
    end
    # expose(:twitter) { {username: "", url: ""} }
    expose(:status) { |person, _| {full_time: 'full'}[person.faculty_status] }
    # expose(:presentations) { [] }
    expose(:research_interests) { |person, _| Array(person.bio_edition.try(:research_interests)) }
    # expose(:affiliations) { [] }
    # expose(:books) { [] }
    expose(:expertise) { |person, _| Array(person.bio_edition.try(:expertise)) }
    # expose(:publications) { [] }
    expose(:email) { |person, _| person.preferred_biola_email }
    # expose(:schools) { [] }
    expose(:degrees) { |person, _| Array(person.bio_edition.try(:degrees)) }
    # expose(:cv) { }
    expose(:biography) { |person, _| person.bio_edition.try(:biography) }
    expose :photo_url do |person, _|
      person.profile_photos.where(type: :Faculty).first.try(:photo_url)
    end
  end
end

# For HTML to text array see http://stackoverflow.com/questions/10144739/convert-html-to-plain-text-with-inclusion-of-brs
