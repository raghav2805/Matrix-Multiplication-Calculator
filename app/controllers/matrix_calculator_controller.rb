class MatrixCalculatorController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def calculate
      raise "Error in dimensions of Matrix A or Matrix B" if params["matrix_a_rows"].to_i <= 0 || params["matrix_a_cols"].to_i <= 0 || params["matrix_b_rows"].to_i <= 0 || params["matrix_b_cols"].to_i <= 0
      raise "Matrix A column must be equal to Matrix B row" if params["matrix_a_cols"].to_i != params["matrix_b_rows"].to_i
  
      matrix_a_rows = params["matrix_a_rows"].to_i
      matrix_a_cols = params["matrix_a_cols"].to_i
      @matrix_a = Array.new(matrix_a_rows) { Array.new(matrix_a_cols) }
  
      matrix_a_rows.times do |i|
        matrix_a_cols.times do |j|
          raise "Any column can't be empty" if params["matrix_a"]["#{i}"]["#{j}"].to_s.strip == ""
          @matrix_a[i][j] = params["matrix_a"]["#{i}"]["#{j}"].to_i
        end
      end
  
      matrix_b_rows = params["matrix_b_rows"].to_i
      matrix_b_cols = params["matrix_b_cols"].to_i
      @matrix_b = Array.new(matrix_b_rows) { Array.new(matrix_b_cols) }
  
      matrix_b_rows.times do |i|
        matrix_b_cols.times do |j|
          raise "Any column can't be empty" if params["matrix_b"]["#{i}"]["#{j}"].to_s.strip == ""
          @matrix_b[i][j] = params["matrix_b"]["#{i}"]["#{j}"].to_i
        end
      end
  
      multiply_matrices()
    rescue StandardError => e
      @error_message = e.message
  end
  

  private

  def multiply_matrices()
    raise "Invalid matrices for multiplication" if @matrix_a[0].length != @matrix_b.length

    @result_matrix = Array.new(@matrix_a.length) { Array.new(@matrix_b[0].length, 0) }

    @matrix_a.length.times do |i|
      @matrix_b[0].length.times do |j|
        @matrix_a[0].length.times do |k|
          @result_matrix[i][j] += @matrix_a[i][k] * @matrix_b[k][j]
        end
      end
    end

    @result_matrix
  rescue StandardError => e
    @error_message = e.message
  end

end
