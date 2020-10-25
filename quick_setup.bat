@echo off

set PROJECT_NAME=Sample
set AUTHOR=Shunya Sasaki
set MAIL=shunya.sasaki.1120@gmail.com
set LICENCE=Individual
set RELEASE=%date%

set VIRTUAL_ENV=.venv
set REQUIREMENTS_FILE=requirements.txt
set SPHINX_DIR=doc

rem readme ====================================================================
if not exist README.md (
    (echo # %PROJECT_NAME%) > README.md
    (echo.) >> README.md
    (echo ## Author) >> README.md
    (echo.) >> README.md
    (echo ^* %AUTHOR% ^&lt^;%MAIL%^&gt^;) >> README.md
)
rem git =======================================================================
if not exist .gitignore (
    (echo /.venv/) > .gitignore
    (echo /.vscode/) >> .gitignore
    (echo **/__pycache__/) >> .gitignore
    (echo /doc/build/) >> .gitignore
    (echo /data/) >> .gitignore
)

rem sphinx ====================================================================
rem directories ---------------------------------------------------------------
if not exist %SPHINX_DIR% mkdir %SPHINX_DIR%
if not exist %SPHINX_DIR%\_static mkdir %SPHINX_DIR%\_static
if not exist %SPHINX_DIR%\_templates mkdir %SPHINX_DIR%\_templates
if not exist %SPHINX_DIR%\build mkdir %SPHINX_DIR%\build

rem make.bat ------------------------------------------------------------------
(echo @ECHO OFF) > %SPHINX_DIR%\make.bat
(echo setlocal enabledelayedexpansion) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat

(echo pushd %%~dp0) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo REM Command file for Sphinx documentation) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo if "%%SPHINXBUILD%%" == "" () >> %SPHINX_DIR%\make.bat
(echo 	set SPHINXBUILD=sphinx-build) >> %SPHINX_DIR%\make.bat
(echo ^)) >> %SPHINX_DIR%\make.bat
(echo set SOURCEDIR=./) >> %SPHINX_DIR%\make.bat
(echo set BUILDDIR=./build) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo if "%%1" == "" goto help) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo %%SPHINXBUILD%% ^>NUL 2^>NUL) >> %SPHINX_DIR%\make.bat
(echo if errorlevel 9009 ^() >> %SPHINX_DIR%\make.bat
(echo 	echo.) >> %SPHINX_DIR%\make.bat
(echo 	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx) >> %SPHINX_DIR%\make.bat
(echo 	echo.installed, then set the SPHINXBUILD environment variable to point) >> %SPHINX_DIR%\make.bat
(echo 	echo.to the full path of the 'sphinx-build' executable. Alternatively you) >> %SPHINX_DIR%\make.bat
(echo 	echo.may add the Sphinx directory to PATH.) >> %SPHINX_DIR%\make.bat
(echo 	echo.) >> %SPHINX_DIR%\make.bat
(echo 	echo.If you don't have Sphinx installed, grab it from) >> %SPHINX_DIR%\make.bat
(echo 	echo.http://sphinx-doc.org/) >> %SPHINX_DIR%\make.bat
(echo 	exit /b 1) >> %SPHINX_DIR%\make.bat
(echo ^)) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat

(echo del *.rst) >> %SPHINX_DIR%\make.bat
(echo sphinx-apidoc -o . ../) >> %SPHINX_DIR%\make.bat
(echo ^(echo Welcome to doucumentation!^) ^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo ==========================^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo ^(echo.^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo .. toctree::^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo    :maxdepth: 4^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo    :caption: Contents:^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo.^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo for %%%%f in ^(*.rst^) do ^() >> %SPHINX_DIR%\make.bat
(echo     if %%%%f==index.rst ^() >> %SPHINX_DIR%\make.bat
(echo         echo skip index) >> %SPHINX_DIR%\make.bat
(echo     ^) else if %%%%f==modules.rst ^() >> %SPHINX_DIR%\make.bat
(echo         del modules.rst) >> %SPHINX_DIR%\make.bat
(echo     ^) else ^() >> %SPHINX_DIR%\make.bat
(echo         set base=%%%%f) >> %SPHINX_DIR%\make.bat
(echo         ^(echo    !base:.rst=!^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo     ^)) >> %SPHINX_DIR%\make.bat
(echo ^)) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo ^(echo.^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo Indeces and tables^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo ==================^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo.^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo * :ref:`genindex`^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo * :ref:`modindex`^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat
(echo ^(echo * :ref:`search`^) ^>^> index.rst) >> %SPHINX_DIR%\make.bat


(echo.) >> %SPHINX_DIR%\make.bat
(echo %%SPHINXBUILD%% -M %%1 %%SOURCEDIR%% %%BUILDDIR%% %%SPHINXOPTS%% %%O%%) >> %SPHINX_DIR%\make.bat
(echo goto end) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo :help) >> %SPHINX_DIR%\make.bat
(echo %%SPHINXBUILD%% -M help %%SOURCEDIR%% %%BUILDDIR%% %%SPHINXOPTS%% %%O%%) >> %SPHINX_DIR%\make.bat
(echo.) >> %SPHINX_DIR%\make.bat
(echo :end) >> %SPHINX_DIR%\make.bat
(echo popd) >> %SPHINX_DIR%\make.bat

rem conf.py -------------------------------------------------------------------
(echo import os) > %SPHINX_DIR%\conf.py
(echo import sys) >> %SPHINX_DIR%\conf.py
(echo sys.path.insert^(0, os.path.abspath^('../'^)^)) >> %SPHINX_DIR%\conf.py
(echo.) >> %SPHINX_DIR%\conf.py
(echo project = '%PROJECT_NAME%') >> %SPHINX_DIR%\conf.py
(echo copyright = '%LICENCE%') >> %SPHINX_DIR%\conf.py
(echo author = '%AUTHOR%') >> %SPHINX_DIR%\conf.py
(echo.) >> %SPHINX_DIR%\conf.py
(echo release = '%RELEASE%') >> %SPHINX_DIR%\conf.py
(echo.) >> %SPHINX_DIR%\conf.py
(echo extensions = ['sphinx.ext.autodoc', 'sphinx.ext.napoleon']) >> %SPHINX_DIR%\conf.py
(echo.) >> %SPHINX_DIR%\conf.py
(echo templates_path = ['_templates']) >> %SPHINX_DIR%\conf.py
(echo.) >> %SPHINX_DIR%\conf.py
(echo language = 'ja') >> %SPHINX_DIR%\conf.py
(echo.) >> %SPHINX_DIR%\conf.py
(echo exclude_patterns = []) >> %SPHINX_DIR%\conf.py
(echo.) >> %SPHINX_DIR%\conf.py
(echo html_theme = 'sphinx_rtd_theme') >> %SPHINX_DIR%\conf.py
(echo html_statick_path = '_static') >> %SPHINX_DIR%\conf.py
(echo.) >> %SPHINX_DIR%\conf.py


rem python ====================================================================
if not exist .venv (
    python -m venv %VIRTUAL_ENV% 
    %VIRTUAL_ENV%\Scripts\activate
    python -m pip install --upgrade pip setuptools
    python -m pip install sphinx spihnx-rtd-theme
    if exist %REQUIREMENTS_FILE% (
        %VIRTUAL_ENV%\Scripts\activate
        python -m pip install -r %REQUIREMENTS_FILE%
    )
) else (
    if exist %REQUIREMENTS_FILE% (
        %VIRTUAL_ENV%\Scripts\activate
        python -m pip install -r %REQUIREMENTS_FILE%
    )
)
