require 'yaml'

module Kovacs::Resources
  extend self

  def nationalities
    resource_path = "#{ Kovacs.root }/resources"
    nationalities = Dir.glob(resource_path + '/*').select { |f| File.directory?(f) }.map { |s| s.split('/')[-1].to_sym }
  end

  def forenames(nationality, sex)
    resource_path = "#{ Kovacs.root }/resources/#{ nationality }/#{ sex }_forename.txt"
    read_resource(resource_path)
  end

  def middle_names(nationality, sex)
    resource_path = "#{ Kovacs.root }/resources/#{ nationality }/#{ sex }_forename.txt"
    read_resource(resource_path)
  end

  def surnames(nationality)
    resource_path = "#{ Kovacs.root }/resources/#{ nationality }/surname.txt"
    read_resource(resource_path)
  end

  private

  def read_resource(resource_path)
    names = File.readlines(resource_path)
                .map { |line| line.gsub("\n", "") }
                .select { |it| not it.empty? }
  end

end
