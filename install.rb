# flag to enable actual file system modifications
$live = true

# produce a list of the config files to link
$ignore = ["README.md","install.rb"]
$files = Dir.entries(Dir.getwd).reject { |f| f.start_with?(".") } - $ignore

# change to the directory containing this script
Dir.chdir(File.dirname(__FILE__))

# prompt the user and exit if they don't reply with 'y'
def confirm(msg)
  print "#{msg} [y/n] "
  response = gets.strip.downcase
  exit unless response.start_with?("y")
end

# recursively link the source file or directory to the target
def link(source, target)
  if File.directory?(source)
    `mkdir #{target}` if $live
    contents = Dir.entries(source) - [".",".."]
    # puts "contents of #{source}: #{contents}"
    contents.each do |f|
      link(File.join(source, f), File.join(target, f))
    end
  else
    `ln #{source} #{target}` if $live
  end
end

# execute a block for each existing file in the home directory that
# will be replaced
def each_existing
  Dir.chdir(Dir.home) do
    $files.each do |f|
      dotted = "." + f
      yield dotted if File.exist?(dotted)
    end
  end
end

# warn about destructiveness
puts "WARNING: This script will replace the following files/directories."
each_existing { |f| puts "  #{f}" }
confirm "Are you sure you want to do this?"

# remove the existing files in the home directory
puts "Removing existing files ..."
each_existing { |f| `rm -rf #{f}` if $live }

# link config files to home directory
puts "Linking config files to home directory ..."
$files.each do |source|
  target = File.join(Dir.home, "." + source)
  link(source, target)
end

# set up vim plugin manager
puts "Installing vim plugin manager ..."
bundle = File.join(Dir.home, ".vim", "bundle")
neobundle = File.join(bundle, "neobundle.vim")
if $live
  `mkdir #{bundle}`
  `git clone https://github.com/Shougo/neobundle.vim #{neobundle}`
end
