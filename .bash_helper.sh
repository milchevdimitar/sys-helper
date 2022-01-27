source /home/$(whoami)/.bash_helper.conf

function print_current_dir_info () {
    
    printf "Current dir: $(pwd)"
        echo
    printf "It contains:"
        echo
    printf "Permissions   Owner    Group  Created        Name"
        echo
    printf "$(ls -lah $(pwd))"
        echo

}

function print_only_dir () {

    printf "List of folders:"
        echo
    printf $(ls -d */)
        echo

}

function change_dir () {

    print_only_dir
    printf "Change dir to:"
    read dir_op
    cd $dir_op

}

function get_out_of_dir () {

    cd ..

}

function console () {

    printf "Root commands:"
        echo
    read the_command
    sudo $the_command
    printf "The command $the_command was executed by $(whoami)(you) !!!"
        echo

}

function print_main_menu () {
    
        echo
    printf "Current time/date: $(date)"
        echo
        echo
    printf "_____ $helper_name ____________________________________"
        echo
    printf " № ) - OPTION"
        echo
        echo
    printf " 1 ) - print current folder info"
        echo
    printf " 2 ) - change current file manager's dir"
        echo
    printf " 3 ) - get out of current file manager's dir"
        echo
    printf " 4 ) - ROOT console"
        echo
    printf " 5 ) - Edit Fstab"
        echo
    printf " 6 ) - Edit alias"
        echo
    printf " 7 ) - Edit bashrc"
        echo
    printf " 8 ) - Print calendar"
        echo    
    printf " 9 ) - Get weather"
        echo
    printf " 10 ) - Actualization ( WORKS ONLY ON ARCH BASED DISTROS )"
        echo
    printf " 10.1 ) - Actualization ( WORKS ONLY ON DEBIAN BASED DISTROS )"
        echo
    printf " 11 ) - Compile single C file ( using GCC compiler )"
        echo
    printf " 11.1 ) - Compile multiple C files ( using GCC compiler )"
        echo
    printf " 12 ) - Python shell"
        echo
    printf " 13 ) - Virsh shell"
        echo
    printf " 14 ) - New window of editor ($EDITOR)"
        echo
    printf " ECF) - Edit conf file of the $helper_name"
        echo        
    printf " Any ) - Exit"
        echo
        echo

}

function edit_fstab () {

    sudo $EDITOR /etc/fstab

}

function edit_alias () {

    $EDITOR $ALIAS_PATH

}

function edit_bashrc () {

    $EDITOR /home/$(whoami)/.bashrc

}

function calendar () {

    myyear=`date +'%Y'`
    cal "$myyear"

}

function weather () {

    curl -s "wttr.in/$1?m1" > .weather
    sed '$d' .weather

}

function full_system_update_upgrade_arch () {

    sudo pacman -Syyu
    $AUR_HELPER -Syyu

}

function full_system_update_upgrade_deb () {

    sudo $DEB_DEFAULT_PACKAGE_MANAGER update
    sudo $DEB_DEFAULT_PACKAGE_MANAGER upgrade

}

function is_done () {

    printf "Status: Done"
        echo

}

function compile_c () {

    printf "What should i compile: "
    read $c_file_name
    printf "Bin file name:"
    read bin_file_name
    gcc $c_file_name -o $bin_file_name 

}

function compile_c_multiple () {

    printf "What should i compile: "
    read $c_file_name
    printf "Libs names:"
    read $libs_c
    printf "Bin file name:"
    read bin_file_name
    gcc $c_file_name $libs_c -o $bin_file_name 

}

loop=0

while [ $loop -le 1 ]

    do

        print_main_menu
        printf "Option:"
        read op_sec

        case $op_sec in

        1)
            print_current_dir_info
            is_done
        ;;
        
        2)
            change_dir
            is_done
        ;;

        3)
            get_out_of_dir
            is_done
        ;;

        4)
            console
            is_done
        ;;

        5)
            edit_fstab
            is_done
        ;;

        6)
            edit_alias
            is_done
        ;;

        7)
            edit_bashrc
            is_done
        ;;

        8)
            calendar
            is_done
        ;;

        9)
            weather
            is_done
        ;;

        10)
            full_system_update_upgrade_arch
            is_done
        ;;

        10.1)
            full_system_update_upgrade_deb
            is_done
        ;;

        11)
            compile_c
            is_done
        ;;

        11.1)
            compile_c_multiple
            is_done
        ;;

        12)
            python
            is_done
        ;;

        13)
            virsh
            is_done
        ;;

        14)
            $EDITOR
            is_done
        ;;

        ECF)
            $EDITOR /home/$(whoami)/.bash_helper.conf
        ;;

        *)
            exit
        ;;
    
    esac

    done