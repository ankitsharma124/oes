class Test < ApplicationRecord
    has_many :questions

    def self.import(file, subject_id)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(2)
        row = Hash[[header, spreadsheet.row(3)].transpose]
        test = find_by_id(row["id"]) || new
        test.total_question =  row["TotalQuestions"]
        test.subject_id = subject_id
        test.title = row["Title"]
        test.total_marks = row["Max_Marks"]
        test.minute_per_question = row["Time_Per_Question"]
        test.passing_marks = row["Passing_Marks"]
        test.negative_marking = false
        total_rows = row["TotalQuestions"].to_i + 5
        
       for i in 6..total_rows
        j = 1
        header = spreadsheet.row(5)
        row = Hash[[header, spreadsheet.row(i)].transpose] 
        question_title = row["Questions"]
        option1 = row["Option1"]
        option2 = row["Option2"]
        option3 = row["Option3"]
        option4 = row["Option4"]
        correct_option = row["CorrectOption"]
        @questions = test.questions.build(:titel=>question_title, :option1=>option1, :option2=>option2, :option3=>option3, :option4=>option4, :correct_option=>correct_option, :sort_order=>j)
        j = j + 1
       end
        test.save!
    end
    
    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
      when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
     end
    end
end
