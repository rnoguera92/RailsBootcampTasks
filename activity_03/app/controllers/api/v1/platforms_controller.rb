module Api
  module V1
    class PlatformsController < ApplicationController

      def index
        platforms = Platform.all
        render json: {status: 'SUCCESS', message:'Loaded platforms', data:platforms},status: :ok
      end

      def show
        platform = Platform.find(params(:id))
        render json: {status: 'SUCCESS', message:'Loaded platform', data:platform},status: :ok
      end

      def create
        platform = Platform.new(platform_params)

        if platform.save
          render json: {status: 'SUCCESS', message:'Saved platform', data:platform},status: :ok
        else
          render json: {status: 'ERROR', message:'platform not saved', data:platform.errors},status: :unprocessable_entity
        end
      end

      def update
          platform = Platform.find(params[:id])
          if platform.update(platform_params)
            render json: {status: 'SUCCESS', message:'Updated platform', data:platform},status: :ok
          else
            render json: {status: 'ERROR', message:'platform not updated', data:platform.errors},status: :unprocessable_entity
          end
      end

      def destroy
        platform = Platform.find(params[:id])
        platform.destroy
        render json: {status: 'SUCCESS', message:'Deleted platform', data:platform},status: :ok
      end

      private
        def platform_params
          params.permit(:name)
        end
    end
  end
end