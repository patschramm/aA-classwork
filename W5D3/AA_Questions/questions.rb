require_relative 'questions_db.rb'
class Question 

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def find_by_author_id(author_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?

        SQL

        raise "no questions" if questions.empty?
        questions.map{|q| Question.new(q)}
    end



end