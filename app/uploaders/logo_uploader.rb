class LogoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  convert :png
  process :resize_to_limit => [1024,1024]

  version :thumb do
    process :resize_to_fill => [120, 120]
    convert :png
  end

end
