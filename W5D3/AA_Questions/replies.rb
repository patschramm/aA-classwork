require_relative 'questions_db.rb'

class Reply

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @author_id = options['author_id']
        @body = options['body']
    end

    def self.find_by_id(id)
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                replies
            WHERE
                options.id = id
        SQL
        Reply.new(options)
    end

    def self.find_by_question_id(question_id)
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                replies
            WHERE
                options.question_id = question_id
        SQL
        options.map {|option| Reply.new(option)}
    end

    def self.find_by_author_id(author_id)
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                replies
            WHERE
                options.author_id = author_id
        SQL
        options.map {|option| Reply.new(option)}
    end

    def self.find_by_parent_id(parent_id)
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                replies
            WHERE
                options.parent_id = parent_id
        SQL
        Reply.new(options)
    end

    def self.find_by_body(body)
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                replies
            WHERE
                options.body = body
        SQL
        Reply.new(options)
    end


end