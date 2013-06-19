class Product < ActiveRecord::Base
  attr_accessible :categoria, :codigo, :photo, :nombre, :precio
  #se utiliza para generar la ruta donde se almacena la foto sin importar donde se ubica el proyecto
  FOTOS = File.join Rails.root, 'public', 'photo_store'
  after_save :guardar_foto
  def photo=(file_data)
  	unless file_data.blank?
  		@file_data =file_data
  		self.extension = file_data.original_filename.split('.').last.downcase
  	end
  end
  def photo_filename
  	File.join FOTOS, "#{id}.#{extension}"
  end
  #ruta base
  def photo_path
  	"/photo_store/#{id}.#{extension}"
  end
  def has_photo?
  	File.exists? photo_filename
  end
  private
  def guardar_foto
  	if @file_data
  		FileUtils.mkdir_p FOTOS
  		# wb abrir archivo en modo de escritura
  		File.open(photo_filename,'wb') do |f|
  			f.write(@file_data.read)
  		end
  		@file_data =nil
  	end
  end
end
