if Rails.env.development?
  module Git
    BRANCH = `git status | sed -n 1p`.split(" ").join(' ')
  	COMMIT = `git log | sed -n 1p`.split(" ").last
  	AUTHOR = `git log | sed -n 2p`.split(" ").join(' ')
  	DATE = `git log | sed -n 3p`.split(" ").join(' ')
    TAG = `git describe`.split(" ").join(' ')

    REVISION = File.exists?(File.join(Rails.root, 'REVISION')) ? File.open(File.join(Rails.root, 'REVISION'), 'r') { |f| GIT_REVISION = f.gets.chomp } : nil
    VERSION = File.exists?(File.join(Rails.root, 'VERSION')) ? File.open(File.join(Rails.root, 'VERSION'), 'r') { |f| GIT_VERSION = f.gets.chomp } : nil
  end
end
