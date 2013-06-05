require 'fluent/plugin'
require 'fluent/config'
require 'fluent/input'
require 'csv'

module Fluent


class TermtterInput < Input
  Plugin.register_input('chatter-admin', self)

  def start
    csv_name = 'FeedPost.csv'
    csv_path = File.expand_path(File.join(File.dirname(__FILE__),
      '..', '..', '..', 'csv', csv_name))
    table = CSV.table(csv_path, encoding: "UTF8")
    keys = table.headers

    CSV.foreach(csv_path, encoding: "UTF8") do |row|
      hashed_row = Hash[*keys.zip(row).flatten]
      pri_key = hashed_row[:id]
      unless pri_key == "Id"
        Engine.emit("chatter.admin",
          Engine.now, {
            "id" => hashed_row[:id],
            "feeditemid" => hashed_row[:feeditemid],
            "parentid" => hashed_row[:parentid],
            "type" => hashed_row[:type],
            "createbyid" => hashed_row[:createbyid],
            "createdate" => hashed_row[:createdate],
            "systemmodstamp" => hashed_row[:systemmodstamp],
            "title" => hashed_row[:title],
            "body"  => hashed_row[:body],
            "linkurl" => hashed_row[:linkurl],
            "isdeleted" => hashed_row[:isdeleted],
            "contentid" => hashed_row[:contentid],
            "relatedrecordid" => hashed_row[:relatedrecordid],
            "insertedbyid" => hashed_row[:insertedbyid],
          }
        )
      end
    end
  end
end


end
