module Api
  module V1
    class BooksController < ApplicationController

      # GET /books or /books.json
      def index
        books = Book.all
        render json: {status: 'SUCCESS', message:'Loaded books', data:books},status: :ok
      end

      # GET /books/1 or /books/1.json
      def show
        book = Book.find(params(:id))
        render json: {status: 'SUCCESS', message:'Loaded book', data:book},status: :ok
      end

      # POST /books or /books.json
      def create
        book = Book.new(book_params)

        if book.save
          render json: {status: 'SUCCESS', message:'Saved book', data:book},status: :ok
        else
          render json: {status: 'ERROR', message:'Book not saved', data:book.errors},status: :unprocessable_entity
        end
      end

      # PATCH/PUT /books/1 or /books/1.json
      def update
          book = Book.find(params[:id])
          if book.update(book_params)
            render json: {status: 'SUCCESS', message:'Updated book', data:book},status: :ok
          else
            render json: {status: 'ERROR', message:'Book not updated', data:book.errors},status: :unprocessable_entity
          end
      end

      # DELETE /books/1 or /books/1.json
      def destroy
        book = Book.find(params[:id])
        book.destroy
        render json: {status: 'SUCCESS', message:'Deleted book', data:book},status: :ok
      end

      private
        def book_params
          params.permit(:name, :price, :author, :editor, :description, :category_id)
        end
    end
  end
end