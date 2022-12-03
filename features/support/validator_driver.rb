module ValidatorDriver

# determine if the feature is being run on Windows or on Linux (GitHub action)
def get_validator_path
  # on windows
  if Gem::Platform.local.os == "mingw32"
    # on my personal laptop
    if Socket.gethostname == "LAPTOP-KL85GOQC"
      path_to_validator = "C\:\\Users\\rob\\Documents\\PC_stuff\\software\\FHIR\\validator\\validator_cli.jar"
    else
      path_to_validator = "C\:\\work\\tools\\fhir-validator\\validator_cli.jar"
    end
  # otherwise in Github action
  else
    path_to_validator = "validator.jar"
  end
  return path_to_validator
end



end

World(ValidatorDriver)