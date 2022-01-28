class Task < ApplicationRecord
    has_many :items, -> { order(position: :asc) }

    enum priority: { baixa: 0, media: 1, alta: 2 }


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
