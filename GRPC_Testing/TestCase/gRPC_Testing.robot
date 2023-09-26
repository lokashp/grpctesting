*** Settings ***
Library           SSHLibrary
Library           Collections
Library           OperatingSystem
Variables         ../constant.yaml
Resource          ../TestSuit/grpc_keywords.robot

*** Test Cases ***

Testcase1
    
    Log To Console    \n\n********* Establishing connection with the remote server ***********\n
    ${rec_res}    Reciver command    ${reciver.host}    ${reciver.user}   ${reciver.pwd}   ${reciver.bin_dir}/${reciver.gRPC_Receiver_Command}    

    ${snd_result}    Sender command specifed path    ${sender.host}    ${sender.user}   ${sender.pwd}         

    Establish SSH Connection    ${reciver.host}    ${reciver.user}   ${reciver.pwd}
    ${open_home}=    SSHLibrary.List Directory     ${sender.target_path}
    Should Contain     ${open_home}    ${sender.file_name}



Testcase2

    ${rec_res}    Reciver command    ${reciver.host}    ${reciver.user}   ${reciver.pwd}   ${reciver.bin_dir}/${reciver.gprc_rec_path_cmd}    
    Log To Console   ${rec_res}

    ${snd_result}    Sender command unspecifed path    ${sender.host}    ${sender.user}   ${sender.pwd}         

    Establish SSH Connection    ${reciver.host}    ${reciver.user}   ${reciver.pwd}
    ${open_home}=    SSHLibrary.List Directory     ${reciver.bin_dir}
    Should Contain     ${open_home}    ${sender.file_name}

Testcase3
    ${rec_res}    Reciver command    ${reciver.host}    ${reciver.user}   ${reciver.pwd}   ${reciver.bin_dir}/${reciver.gprc_rec_path_cmd}    
    Log To Console   ${rec_res}

    ${snd_result}    Send multiple mutiple_files    ${sender.host}    ${sender.user}   ${sender.pwd}         

    Establish SSH Connection    ${reciver.host}    ${reciver.user}   ${reciver.pwd}
    ${open_home}=    SSHLibrary.List Directory     ${reciver.bin_dir}
    

Testcase4
    ${rec_res}    Reciver command    ${reciver.host}    ${reciver.user}   ${reciver.pwd}   ${reciver.bin_dir}/${reciver.receiver_compress_disabled}    
    Log To Console   ${rec_res}

    ${snd_result}    Sender command unspecifed path    ${sender.host}    ${sender.user}   ${sender.pwd}         

    Establish SSH Connection    ${reciver.host}    ${reciver.user}   ${reciver.pwd}
    ${open_home}=    SSHLibrary.List Directory     ${reciver.bin_dir}
    Should Contain     ${open_home}    ${sender.file_name}

Testcase5
    ${rec_res}    Reciver command    ${reciver.host}    ${reciver.user}   ${reciver.pwd}   ${reciver.bin_dir}/${reciver.gprc_rec_path_cmd}    
    Log To Console   ${rec_res}

    ${snd_result}    Receiver compress enabled     ${sender.host}    ${sender.user}   ${sender.pwd}         

    Establish SSH Connection    ${reciver.host}    ${reciver.user}   ${reciver.pwd}
    ${open_home}=    SSHLibrary.List Directory     ${reciver.bin_dir}
    Should Contain     ${open_home}    ${sender.file_name}

Testcase6
    ${rec_res}    Reciver command    ${reciver.host}    ${reciver.user}   ${reciver.pwd}   ${reciver.bin_dir}/${reciver.gprc_rec_path_cmd}    
    Log To Console   ${rec_res}

    ${snd_result}    Sender CheckSum OFF    ${sender.host}    ${sender.user}   ${sender.pwd}         

    Establish SSH Connection    ${reciver.host}    ${reciver.user}   ${reciver.pwd}
    ${open_home}=    SSHLibrary.List Directory     ${reciver.bin_dir}
    Should Contain     ${open_home}    ${sender.file_name}

Testcase7
    ${rec_res}    Reciver command    ${reciver.host}    ${reciver.user}   ${reciver.pwd}   ${reciver.bin_dir}/${reciver.gprc_rec_path_cmd}    
    Log To Console   ${rec_res}

    ${snd_result}    Sender CheckSum ON    ${sender.host}    ${sender.user}   ${sender.pwd}         

    Establish SSH Connection    ${reciver.host}    ${reciver.user}   ${reciver.pwd}
    ${open_home}=    SSHLibrary.List Directory     ${reciver.bin_dir}
    Should Contain     ${open_home}    ${sender.file_name}


    

