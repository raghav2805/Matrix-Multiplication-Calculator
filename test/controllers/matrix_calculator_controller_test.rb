require "test_helper"

class MatrixCalculatorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matrix_calculator_index_url
    assert_response :success
  end

  test "should get calculate" do
    get matrix_calculator_calculate_url
    assert_response :success
  end
end
