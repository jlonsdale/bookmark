require 'pg'

class Bookmarks

  attr_reader :title, :url

  def initialize(id:, title:, url:)
   @id  = id
   @title = title
   @url = url
  end

  def id
    @id.to_i
  end

  def self.all
    connection = which_connection
    result = connection.exec("SELECT * FROM bookmarks")
    @results = result.map do |bookmark|
     Bookmarks.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
    @results
  end

  def self.add_bookmark(url,title)
    connection = which_connection
    result = connection.exec( "INSERT INTO bookmarks (url,title) VALUES('#{url}', '#{title}') RETURNING id,url,title;" )
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id)
    connection = which_connection
    connection.exec("DELETE FROM bookmarks WHERE id =#{id};")
  end

  def self.update(id,title,url)
    connection = which_connection
    connection.exec(
      "UPDATE bookmarks
      SET title='#{title}', url='#{url}t'
      WHERE id=#{id};"
      )
  end

  private

  def self.which_connection
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'bookmark_manager_test')
    else
      return PG.connect(dbname: 'bookmark_manager')
    end
  end

end
