class PortfolioUploader < CarrierWave::Uploader::Base
  # include Cloudinary::CarrierWave

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # def public_id
  #   return model.title
  # end  

end