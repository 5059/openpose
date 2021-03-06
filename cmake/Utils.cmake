# TODO -- add checksum.
# TODO -- remove hardcoded ubuntu paths
function (download_model MODEL_NAME MODEL_DOWNLOAD_FLAG MODEL_RELATIVE_PATH CHECKSUM)
  if (MODEL_DOWNLOAD_FLAG)
    message(STATUS "Now downloading ${MODEL_NAME} model")
    message(STATUS "NOTE: Might take time if your internet connection is slow.")
    set(MODEL_FILENAME ${CMAKE_SOURCE_DIR}/models/${MODEL_RELATIVE_PATH})
    if (NOT EXISTS ${MODEL_FILENAME})
      file(DOWNLOAD ${OPENPOSE_URL}${MODEL_RELATIVE_PATH} ${MODEL_FILENAME}
          EXPECTED_MD5 ${CHECKSUM}) # SHOW_PROGRESS)
    else (NOT EXISTS ${MODEL_FILENAME})
      message(STATUS "Model already exists.")
    endif (NOT EXISTS ${MODEL_FILENAME})
  else (DOWNLOAD_MPI_MODEL)
    message(STATUS "Not downloading ${MODEL_NAME} model")
  endif (MODEL_DOWNLOAD_FLAG)
endfunction (download_model)
