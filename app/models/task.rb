class Task < ApplicationRecord

    #relationships...................................................................
    has_many :items, inverse_of: :task , dependent: :destroy
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

    #enums...........................................................................
    enum priority: { baixa: 0, media: 1, alta: 2 }

    #validates
    validates :name, presence: true

    #save archive...................................................................
    def archive=(value)
        if value.is_a?(String)
            super(value)
        else
           name_file = "#{Time.now.to_i}-#{value.original_filename}"
           file_path = "#{Rails.root}/public/arquivos/"

           path_with_file = "#{file_path}#{name_file}"

           Dir.mkdir(file_path) unless Dir.exists?(file_path) 
           File.open(path_with_file, "wb") { |f| f.write(value.read) }

            super("/arquivos/#{name_file}")
        end   
    end

end
