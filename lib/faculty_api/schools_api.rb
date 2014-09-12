module FacultyAPI
  class SchoolsAPI < Grape::API
    resource :school do
      desc "All faculty"
      get :all do
        present Person.where(faculty_status: :full), with: FacultyIndexEntity
      end
    end
  end
end
