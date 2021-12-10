# frozen_string_literal: true

module Api
  module V1
    # tag type api logic
    class TagsTypeController < ApplicationController
      def index
        tags_type = TagType.all
        render json: { status: 'SUCCESS', message: 'Loaded tags types', data: tags_type }, status: :ok
      end

      def show
        tag_type = TagType.find(params(:id))
        render json: { status: 'SUCCESS', message: 'Loaded tag type', data: tag_type }, status: :ok
      end

      def create
        tag_type = TagType.new(tag_type_params)

        if tag_type.save
          render json: { status: 'SUCCESS', message: 'Saved tag type', data: tag_type }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Book not tag type', data: tag_type.errors },
                 status: :unprocessable_entity
        end
      end

      def update
        tag_type = TagType.find(params[:id])
        if tag_type.update(book_params)
          render json: { status: 'SUCCESS', message: 'Updated tag type', data: tag_type }, status: :ok
        else
          render json: { status: 'ERROR', message: 'tag type not updated', data: tag_type.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        tag_type = TagType.find(params[:id])
        tag_type.destroy
        render json: { status: 'SUCCESS', message: 'Deleted tag type', data: tag_type }, status: :ok
      end

      private

      def tag_type_params
        params.permit(:name)
      end
    end
  end
end
