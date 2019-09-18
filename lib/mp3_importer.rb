class MP3Importer
  attr_accessor :path

  def initialize path
    @path = path
  end

  def files
    Dir.entries(path).delete_if {|entry| entry == "." || entry == ".."}
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end
end
