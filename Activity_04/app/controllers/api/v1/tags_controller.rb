# frozen_string_literal: true

module Api
  module V1
    # tag api logic
    class TagsController < ApplicationController
      def index
        tags = Tag.all
        render json: { status: 'SUCCESS', message: 'Loaded tags', data: tags }, status: :ok
      end

      def show
        tag = Tag.find(params(:id))
        render json: { status: 'SUCCESS', message: 'Loaded tag', data: tag }, status: :ok
      end

      def create
        tag = Tag.new(tag_params)

        if tag.save
          render json: { status: 'SUCCESS', message: 'Saved tag', data: tag }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Book not tag', data: tag.errors }, status: :unprocessable_entity
        end
      end

      def update
        tag = Tag.find(params[:id])
        if tag.update(book_params)
          render json: { status: 'SUCCESS', message: 'Updated tag', data: tag }, status: :ok
        else
          render json: { status: 'ERROR', message: 'tag not updated', data: tag.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        tag = Tag.find(params[:id])
        tag.destroy
        render json: { status: 'SUCCESS', message: 'Deleted tag', data: tag }, status: :ok
      end

      private

      def tag_params
        params.permit(:name, :tag_type_id)
      end
    end
  end
end
