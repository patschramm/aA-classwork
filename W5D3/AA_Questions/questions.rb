require 'byebug'
require_relative 'questions_db.rb'
class Question 
    attr_accessor :id, :title, :body, :author_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def self.find_by_id(id)
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
              *
            FROM
              questions
            WHERE
              options.id = id
        SQL
        Question.new(options)
    end

    def self.find_by_title(title)
        options = QuestionsDatabase.instance.execute(<<-SQL)
          SELECT
            *
          FROM
            questions
          WHERE
            options.title = title
        SQL
        Question.new(options)
    end

    def self.find_by_author_id(author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                questions.author_id = author_id
        SQL
        raise "no questions" if questions.empty?
        questions.map { |q| Question.new(q) }
    end

end

q = Question.new()