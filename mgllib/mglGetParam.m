% mglGetParam.m
%
%        $Id: mglMovie.m,v 1.1 2007/10/23 22:21:23 justin Exp $
%      usage: mglGetParam(paramName);
%         by: justin gardner
%       date: 12/30/08
%    purpose: Get MGL parameters
%
%verbose = mglGetParam('verbose');
function retval  = mglGetParam(paramName)

% default to returning empty
retval = [];

% get the global
global MGL

if (nargin ~= 1)
  help mglGetParam;
  disp(sprintf('(mglGetParam) List of all mgl global parameters'));
  MGL
  return
end

% and grab the field if it exist
if isfield(MGL,paramName)
  retval = MGL.(paramName);
else
  % special case for displayNumber -- if none exists, return
  % -1 to signal that the display is closed
  if strcmp(paramName,'displayNumber')
    retval = -1;
  end
  % special case for soundNames, default to cell array
  if strcmp(paramName,'soundNames') || strcmp(paramName,'movieStructs')
    retval = {};
  end
end

    
