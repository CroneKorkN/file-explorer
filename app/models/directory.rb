class Directory
  def initialize path
    @elements = Dir.entries(current_directory).collect do |element|
      real_path_absolute = "#{current_directory}/#{element}"
      stat = File.stat(real_path_absolute)
      is_file = stat.file?
      {
        size: (is_file ? (number_to_human_size stat.size rescue '-'): '-'),
        type: (is_file ? :file : :directory),
        date: (stat.mtime.to_formatted_s(:short) rescue '-'),
        relative: my_escape("#{current_url}#{element}").gsub('%2F', '/'),
        entry: "#{element}#{is_file ? '': '/'}",
        absolute: real_path_absolute
      }
    end.sort_by { |entry| "#{entry[:type]}#{entry[:relative]}" }
  end
  
  attr_reader :elements
end
