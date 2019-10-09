require 'pg'

def setup_testing_database

  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE bookmarks;")
  connection.exec("ALTER SEQUENCE bookmarks_id_seq RESTART WITH #{1};")

end
