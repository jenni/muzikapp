class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def create
    #make an object in your bucket for the upload
    file_to_upload = params[:file]
    file_name = params[:file].original_filename
    bucket = S3.bucket(S3_BUCKET.name)

    obj = bucket.object(file_name)
    #upload the file:
    obj.put(
    acl: "public-read",
    body: file_to_upload
    )

    #create an object for the upload
    @song = Song.new(
    url: obj.public_url,
    name: obj.key
    )
  
    #save the upload
    if @song.save
      redirect_to songs_path, notice: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def delete
    @song = Song.find_by(params[:file])
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_path }
      format.json { head :no_content }
    end

    bucket = S3.bucket(S3_BUCKET.name)
    obj = bucket.object(params[:song])
    obj.delete

  end

end
