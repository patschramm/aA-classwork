require_relative 'questions_db.rb'

class User
    attr_accessor :id, :fname, :lname

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_id(id)
        options = QuestionsDatabase.instance.execute(<<-SQL)
          SELECT
            *
          FROM
            users
          WHERE
            users.id = id
        SQL
        User.new(options)
    end

    def self.find_by_name(fname, lname)
        options = QuestionsDatabase.instance.execute(<<-SQL)
          SELECT
            *
          FROM
            users
          WHERE
            users.fname = fname AND users.lname = lname
        SQL
        options.map { |option| User.new(option) }
    end
end