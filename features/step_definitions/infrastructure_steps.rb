Given('a test file named {string} exists') do |testfile|
  @testfile = testfile
  expect(@testfile).to be_in_testcase_directory
end

When('I run the validator command on this testfile against profile {string}') do |profile_id|

  include ValidatorDriver

  cmd = TTY::Command.new(printer: :null)

  path_to_validator = get_validator_path()

  profile_url = "#{PROFILE_BASE}#{profile_id}"

  validator_command = "java -jar #{path_to_validator} -version #{FHIR_VERSION} #{@testfile} -ig #{IG_PACKAGE} -profile #{profile_url} -level errors"

  if USE_TERM_SERVER == "yes"

    validator_command << " -tx #{TERM_SERVER}" 

  end

  begin

    # first check if validator is present
    # and if not, manage exception
    if not(File.exist?(path_to_validator))
      raise ValidatorNotPresentError
    # otherwise run the validator
    else
      Kernel.puts "      Running validation command..."
      @output, @err = cmd.run(validator_command)
    end
  
  # rescue errors caused by validation errors
  rescue TTY::Command::ExitError => e
    # Kernel.puts e.to_s
    @output = e.to_s
    true

  # rescue the exception when the validator is not found
  rescue ValidatorNotPresentError => e
    # Kernel.puts e.to_s
    expect(path_to_validator).to be_accessible

  end 

end

Then('the output will include the result {string}') do |output_result|
  expect(@output).to include_output_result(output_result)
end

Then('{string} is raised with message {string}') do |resultType, message|
  expect(@output).to have_result_type_with_message(resultType, message)
end
