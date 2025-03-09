module Transactions
  def CreateService < ApplicationService
    def call
      validate_dependencies || create_transaction
    end

    private

    def validate_dependencies
      return failure([USER_NOT_FOUND_MSG]) unless user
      return failure([ACCOUNT_NOT_FOUND_MSG]) unless account
      return failure([CATEGORY_NOT_FOUND_MESSAGE]) unless category || permitted_params[:transfer] == true
      
      false
    end

  end
end
