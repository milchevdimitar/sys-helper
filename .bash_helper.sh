#conf files
source /home/$(whoami)/.bash_helper.conf
source /home/$(whoami)/.bash_helper_colors.conf

loop=0

function print_current_dir_info () {
    
    printf "${main_color}Current dir: $(pwd)"
        echo
    printf "${main_color}It contains:"
        echo
    printf "${main_color}Permissions   Owner    Group  Created        Name"
        echo
    printf "${main_color}$(ls -lah $(pwd))"
        echo

}

function print_only_dir () {

    printf "${main_color}List of folders:"
        echo
    printf $(ls -d */)
        echo

}

function change_dir () {

    print_only_dir
    printf "${main_color}Change dir to:"
    read dir_op
    cd $dir_op

}

function get_out_of_dir () {

    cd ..

}

function console () {

    printf "${main_color}Root commands:"
        echo
    read the_command
    sudo $the_command
    printf "${main_color}The command $the_command was executed by $(whoami)(you) !!!"
        echo

}

function print_main_menu () {
    
        echo
    printf "${debian_color}Current time/date: $(date)"
        echo
        echo
    printf "${option_color}____ $helper_name _________________________________________________________________"
        echo
    printf "${option_color}№ )${main_color} - OPTION"
        echo
        echo
    printf "${option_color}1 )${main_color} - print current folder info"
        echo
    printf "${option_color}2 )${main_color} - change current file manager's dir"
        echo
    printf "${option_color}3 )${main_color} - get out of current file manager's dir"
        echo
    printf "${option_color}4 )${main_color} - ROOT console"
        echo
    printf "${option_color}5 )${main_color} - Edit Fstab"
        echo
    printf "${option_color}6 )${main_color} - Edit alias"
        echo
    printf "${option_color}7 )${main_color} - Edit bashrc"
        echo
    printf "${option_color}8 )${main_color} - Print calendar"
        echo    
    printf "${option_color}9 )${main_color} - Get weather"
        echo
    printf "${option_color}10 )${main_color} - Actualization ${warning_color}( WORKS ONLY ON ${arch_color}ARCH\e[0m ${warning_color}BASED DISTROS )"
        echo
    printf "${option_color}10.1 )${main_color} - Actualization ${warning_color}( WORKS ONLY ON ${debian_color}DEBIAN\e[0m ${warning_color}BASED DISTROS )"
        echo
    printf "${option_color}11 )${main_color} - Compile single C file ( using GCC compiler )"
        echo
    printf "${option_color}11.1 )${main_color} - Compile multiple C files ( using GCC compiler )"
        echo
    printf "${option_color}12 )${main_color} - ${warning_color}Python\e[0m ${main_color}shell"
        echo
    printf "${option_color}13 )${main_color} - Virsh shell"
        echo
    printf "${option_color}14 )${main_color} - New window of editor ($EDITOR)"
        echo
    printf "${option_color}15 )${main_color} - Start playing Counter Strike: Global Offensive"
        echo
    printf "${option_color}16 )${main_color} - SYSINOP"
        echo
    printf "${option_color}ECFO )${main_color} - Edit conf file for options of the $helper_name"
        echo
    printf "${option_color}ECFC )${main_color} - Edit conf file for colors of the $helper_name"
        echo        
    printf "${exit_color}Any ) - Countinue to bash terminal"
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

    printf "${main_color}Status: Done"
        echo

}

function compile_c () {

    printf "${main_color}What should i compile: "
    read $c_file_name
    printf "${main_color}Bin file name:"
    read bin_file_name
    gcc $c_file_name -o $bin_file_name 

}

function compile_c_multiple () {

    printf "${main_color}What should i compile: "
    read $c_file_name
    printf "${main_color}Libs names:"
    read $libs_c
    printf "${main_color}Bin file name:"
    read bin_file_name
    gcc $c_file_name $libs_c -o $bin_file_name 

}

function cs_menu () {

    printf "${main_color} 1 ) - Start Counter Strike: Global Offensive"
        echo
    printf "${main_color} 2 ) - Start Counter Strike: Global Offensive with hacks"
        echo
    printf "${exit_color} Any ) - Exit function"
        echo
    
}

function cs_commands () {

    cs="steam steam://rungameid/730"
    cs_hacked="./home/$(whoami)/Fuzion/load"

}

function cs () {

    while [ $loop -le 1 ]

        do    

            cs_menu
            cs_commands

            printf "${main_color}Option:"
            read op_sec

            case $op_sec in 

                1)
                    $cs
                    is_done
                ;;

                2)
                    $cs_hacked & 
                    is_done
                ;;
                
                *)
                    break
                ;;

            esac

        done

}

while [ $loop -le 1 ]

    do

        print_main_menu
        printf "${main_color}Option:"
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

            15)
                cs
                is_done
            ;;

            16)
                ./sysinop
                is_done
            ;;

            ECFO)
                $EDITOR /home/$(whoami)/.bash_helper.conf
            ;;

            ECFC)
                $EDITOR /home/$(whoami)/.bash_helper_colors.conf        
            ;;

            *)
                exit
            ;;

        esac

    done

exit