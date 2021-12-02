module Api
  module V1
    class CompaniesController < ApplicationController

      def index
        companies = Company.all
        render json: {status: 'SUCCESS', message:'Loaded companies', data:companies},status: :ok
      end

      def show
        company = Company.find(params(:id))
        render json: {status: 'SUCCESS', message:'Loaded company', data:company},status: :ok
      end

      def create
        company = Company.new(company_params)

        if company.save
          render json: {status: 'SUCCESS', message:'Saved company', data:company},status: :ok
        else
          render json: {status: 'ERROR', message:'company not saved', data:company.errors},status: :unprocessable_entity
        end
      end

      def update
          company = Company.find(params[:id])
          if company.update(company_params)
            render json: {status: 'SUCCESS', message:'Updated company', data:company},status: :ok
          else
            render json: {status: 'ERROR', message:'company not updated', data:company.errors},status: :unprocessable_entity
          end
      end

      def destroy
        company = Company.find(params[:id])
        company.destroy
        render json: {status: 'SUCCESS', message:'Deleted company', data:company},status: :ok
      end

      private
        def company_params
          params.permit(:name)
        end
    end
  end
end