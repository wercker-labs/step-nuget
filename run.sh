if [ -n "$WERCKER_NUGET_PACKAGES_CONFIGS" ]; then
  for FILENAME in $WERCKER_NUGET_PACKAGES_CONFIGS
  do
    echo "/cygdrive/c/Program\ Files/nuget.exe install \"$FILENAME\" -OutputDirectory \"$WERCKER_NUGET_OUTPUT_DIRECTORY\""
    /cygdrive/c/Program\ Files/nuget.exe install "$FILENAME" -OutputDirectory "$WERCKER_NUGET_OUTPUT_DIRECTORY"
  done
else
  echo "Searching for packages.config files."

  for FILENAME in `find . -name packages.config | sed 's/^\.\///'`
  do
    echo "/cygdrive/c/Program\ Files/nuget.exe install \"$FILENAME\" -OutputDirectory \"$WERCKER_NUGET_OUTPUT_DIRECTORY\""
    /cygdrive/c/Program\ Files/nuget.exe install "$FILENAME" -OutputDirectory "$WERCKER_NUGET_OUTPUT_DIRECTORY"
  done
fi

