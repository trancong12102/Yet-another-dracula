#!/bin/bash
### PATH
readonly ICONS="$HOME/.local/share/icons"
readonly PATCH_PATHS=(
	"$ICONS/Tela"
	"$ICONS/Tela-dark"
	"$ICONS/Tela-purple"
	"$ICONS/Tela-purple-dark"
)
### COLOR PALETTE
readonly BACKGROUND=#282a36
readonly CURRENT_LINE=#44475a
readonly FOREGROUND=#f8f8f2
readonly PURPLE_DARK_1=#7c60a3
readonly PURPLE=#bd93f9
readonly COMMENT_DARK_1=#566490
readonly COMMENT=#6272a4
readonly COMMENT_LIGHT_1=#7184bd
readonly CYAN=#8be9fd
readonly GREEN=#50fa7b
readonly ORANGE=#ffb86c
readonly ORANGE_DARK_1=#e6a661
readonly PINK=#ff79c6
readonly RED=#ff5555
readonly YELLOW=#f1fa8c

### Replacements
## Purple
readonly PURPLE_RPS=('#7e57c2' '#5294e2')
## Purple dark 1
readonly PURPLE_DARK_1_RPS=('#3578c7')
## Blue
readonly BLUE_RPS=('#498cd8' '#608cc5' '#324090' '#53a6bc' '#209ae7' '#2e6ea9' '#5091dd' '#71bc42' '#8dd786' '#368eb7')
## Blue light 1
readonly BLUE_LIGHT_1_RPS=('#71a5e8' '#5ca4ed' '#5ca0d6' '#6390cb' '#3fa7d7')
## Cyan
readonly CYAN_RPS=('#a0ecff' '#c0f957')
## Green
readonly GREEN_RPS=()
## Red
readonly RED_RPS=('#cf000f' '#da4453')
## Orange
readonly ORANGE_RPS=('#5da3ee')
## Orange dark 1
readonly ORANGE_DARK_1_RPS=('#3e74b7')

patch_color () {
	need_patch_color=$1
	patch_color=$2

	for path in "${PATCH_PATHS[@]}"; do
		echo "PATCHING $path..."
    		find "$path" \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/$need_patch_color/$patch_color/g"
	done
}

echo 'Patching purple colors...'
for color in "${PURPLE_RPS[@]}"; do
	echo "-> replace $color with $PURPLE"
	patch_color $color $PURPLE
done
for color in "${PURPLE_DARK_1_RPS[@]}"; do
	echo "-> replace $color with $PURPLE_DARK_1"
	patch_color $color $PURPLE
done
echo 'Patching blue colors...'
for color in "${BLUE_RPS[@]}"; do
	echo "-> replace $color with $COMMENT"
	patch_color $color $COMMENT
done
for color in "${BLUE_LIGHT_1_RPS[@]}"; do
	echo "-> replace $color with $COMMENT_LIGHT_1"
	patch_color $color $COMMENT_LIGHT_1
done
echo 'Patching cyan colors...'
for color in "${CYAN_RPS[@]}"; do
	echo "-> replace $color with $CYAN"
	patch_color $color $CYAN
done
echo 'Patching green colors...'
for color in "${GREEN_RPS[@]}"; do
	echo "-> replace $color with $GREEN"
	patch_color $color $GREEN
done
echo 'Patching red colors...'
for color in "${RED_RPS[@]}"; do
	echo "-> replace $color with $RED"
	patch_color $color $RED
done
echo 'Patching orange colors...'
for color in "${ORANGE_RPS[@]}"; do
	echo "-> replace $color with $ORANGE"
	patch_color $color $ORANGE
done
for color in "${ORANGE_DARK_1_RPS[@]}"; do
	echo "-> replace $color with $ORANGE_DARK_1"
	patch_color $color $ORANGE_DARK_1
done
echo 'Done!'

