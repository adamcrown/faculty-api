module FacultyAPI
  class API < Grape::API
    format :json

    helpers URLForHelper

    mount SchoolsAPI

    resource :faculty do
      desc 'Details on a specific faculty member'
      get ':slug' do
        person = Person.find_by(faculty_status: :full_time, slug: params[:slug])
        present person, with: FacultyEntity
      end
    end
  end
end
