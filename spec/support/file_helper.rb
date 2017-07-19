module FileHelper
  def output_file(file_path)
    File.read(file_path.gsub("/input/", "/output/"))
  end
end
