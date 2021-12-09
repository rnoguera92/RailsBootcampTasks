# frozen_string_literal: true

require 'json'
module Api
  module V1
    class PeopleController < ApplicationController
      def index
        people = if params[:tag]
                   Person.includes(:tags).where('tags.name = ?', params[:tag]).references(:tags)
                 else
                   Person.all
                 end
        render json: { status: 'SUCCESS', message: 'Loaded people', data: people.to_json(include: :tags) }, status: :ok
      end

      def show
        person = Person.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded person', data: person }, status: :ok
      end

      def create
        person = Person.new(person_params.except(:tags))

        if person.save
          (JSON.parse person_params[:tags]).each { |t| person.tags << Tag.find(t) }
          render json: { status: 'SUCCESS', message: 'Saved person', data: person }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Book not person', data: person.errors },
                 status: :unprocessable_entity
        end
      end

      def update
        person = Person.find(params[:id])
        if person.update(person_params.except(:tags))
          person.tags.destroy_all
          (JSON.parse person_params[:tags]).each { |t| person.tags << Tag.find(t) }
          render json: { status: 'SUCCESS', message: 'Updated person', data: person }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Person not updated', data: person.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        person = Person.find(params[:id])
        person.destroy
        render json: { status: 'SUCCESS', message: 'Deleted person', data: person }, status: :ok
      end

      private

      def person_params
        params.permit(:id, :fname, :lname, :nid, :phone_number, :address, :person_type, :tags)
      end
    end
  end
end
