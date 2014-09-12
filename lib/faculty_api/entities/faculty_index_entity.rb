module FacultyAPI
  class FacultyIndexEntity < Grape::Entity
    expose :url do |person, _|
      "https://faculty.biola.edu/#{person.slug}"
    end
    expose :slug
    expose :titles
    expose :name
    expose :photo_url do |person, _|
      person.profile_photos.where(type: :Faculty).first.try(:photo_url)
    end
  end
end
