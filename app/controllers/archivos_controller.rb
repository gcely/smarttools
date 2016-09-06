class ArchivosController < ApplicationController
  before_action :validate_concurso, only: [:show, :edit, :update, :destroy]
  before_action :set_archivo, only: [:show, :edit, :update, :destroy]

  # GET /archivos
  # GET /archivos.json
  def index
    @archivos = Archivo.all
  end

  # GET /archivos/1
  # GET /archivos/1.json
  def show
  end

  # GET /archivos/new
  def new
    @archivo = Archivo.new
  end

  # GET /archivos/1/edit
  def edit
  end

  # POST /archivos
  # POST /archivos.json
  def create

    @concurso= Concurso.find(params[:concurso_url])
    @archivo = Archivo.new(archivo_params)
   # @archivo =Archivo.new(nombres: 'asdad', apellidos: nil, email: 'jeffersonaaj@com.co', video: 'SampleVtest.mp4', mensaje: 'kakjlasdajksd', estado: nil, concurso_id: concurso_url)
    @archivo.concurso= @concurso

   vid = params[:archivo][:archivo]
    #@archivo.video = vid.original_filename

    upload_file(vid)
    respond_to do |format|

      if @archivo.save
        format.html { redirect_to concursos_url, notice: 'Archivo was successfully created.' }
        format.json { render :show, status: :created, location: @archivo }
      else
        format.html { render :new }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /archivos/1
  # PATCH/PUT /archivos/1.json
  def update
    respond_to do |format|
      if @archivo.update(archivo_params)
        format.html { redirect_to @concurso, notice: 'Archivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @archivo }
      else
        format.html { render :edit }
        format.json { render json: @archivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /archivos/1
  # DELETE /archivos/1.json
  def destroy
    @archivo.destroy
    respond_to do |format|
      format.html { redirect_to concursos_url, notice: 'Archivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_archivo
      @archivo = Archivo.find(params[:concurso_id])
    end

  def upload_file(file)
    # Declaring
    uploader = VideoUploader.new
    # Upload it
    uploader.store!(file)
    return uploader.url
end

  private
    # Use callbacks to share common setup or constraints between actions.
  


    # Never trust parameters from the scary internet, only allow the white list through.
    def archivo_params
      params.require(:archivo).permit(:nombres, :apellidos, :email, :video, :mensaje, :estado)

      end

      def validate_concurso
      redirect_to @concurso, notice: 'Selecciona un Concurso' 
      end

      def url_concurso
      redirect_to @concurso, notice: 'Selecciona un Concurso' 
      end

     
end
