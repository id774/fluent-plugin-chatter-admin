require 'fluent/plugin'
require 'fluent/config'
require 'fluent/input'
require 'sqlite3'

module Fluent


class TermtterInput < Input
  Plugin.register_input('chatter-admin', self)

  def start
    db_name = 'chatter.db'
    db_path = File.expand_path(File.join(File.dirname(__FILE__),
      '..', '..', '..', 'db', db_name))
    db = SQLite3::Database.new(db_path)

    sql = "select
           feedposts.Id,
           feedposts.CreatedDate,
           feedposts.Title,
           feedposts.Body,
           feedposts.LinkUrl,
           feedposts.IsDeleted,
           users.Id,
           users.Username,
           users.FirstName,
           users.LastName,
           users.CompanyName,
           users.Division,
           users.Department,
           users.Title,
           users.IsActive,
           users.Email
           from feedposts left join users on (feedposts.CreatedById = users.Id)"

    db.execute(sql) do |row|
      Engine.emit("chatter.admin",
        Engine.now, {
          "id"           => row[0],
          "created_at"   => row[1],
          "title"        => row[2],
          "body"         => row[3],
          "linkurl"      => row[4],
          "is_deleted"   => row[5],
          "user_id"      => row[6],
          "username"     => row[7],
          "firstname"    => row[8],
          "lastname"     => row[9],
          "companyname"  => row[10],
          "division"     => row[11],
          "department"   => row[12],
          "user_title"   => row[13],
          "is_active"    => row[14],
          "email"        => row[15],
        }
      )
    end

    db.close
  end
end


end
