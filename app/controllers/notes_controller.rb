# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :find_note, only: :destroy
  def index
    @notes = Note.order(:created_at)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Note was successfully created!" }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @note.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Note was successfully deleted!" }
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :text)
  end

  def find_note
    @note = Note.find(params.require(:id))
  end
end
