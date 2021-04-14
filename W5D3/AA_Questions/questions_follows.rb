require_relative 'questions_db.rb'

class QuestionFollow
    attr_accessor :id, :user_id, :question_id

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.find_by_id(id)
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
              *
            FROM
              question_follows
            WHERE
              options.id = id
        SQL
        QuestionFollow.new(options)
    end

    def self.find_by_user_id(user_id)
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
              *
            FROM
              question_follows
            WHERE
              options.user_id = user_id
        SQL
        options.map { |option| QuestionFollow.new(option) }
    end

    def self.find_by_question_id(question_id)
        options = QuestionsDatabase.instace.execute(<<-SQL)
            SELECT
              *
            FROM
              question_follows
            WHERE
              options.question_id = question_id
        SQL
        options.map { |option| QuestionFollow.new(option) }
    end
end