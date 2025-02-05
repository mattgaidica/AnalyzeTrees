function [BW_out,properties] = filterTreeRegions(BW_in)
%filterRegions  Filter BW image using auto-generated code from imageRegionAnalyzer app.
%  [BW_OUT,PROPERTIES] = filterRegions(BW_IN) filters binary image BW_IN
%  using auto-generated code from the imageRegionAnalyzer app. BW_OUT has
%  had all of the options and filtering selections that were specified in
%  imageRegionAnalyzer applied to it. The PROPERTIES structure contains the
%  attributes of BW_out that were visible in the app.

% Auto-generated by imageRegionAnalyzer app on 07-Jul-2019
%---------------------------------------------------------

BW_out = bwareafilt(BW_in, 1000);

% Fill holes in regions.
BW_out = imfill(BW_out, 'holes');

% Filter image based on image properties.
BW_out = bwpropfilt(BW_out, 'Area', [500, 15000]);
BW_out = bwpropfilt(BW_out, 'Solidity', [0.65, 1]);

% Get properties.
properties = regionprops(BW_out, {'Area', 'Eccentricity', 'EquivDiameter', 'EulerNumber', 'MajorAxisLength', 'MinorAxisLength', 'Orientation', 'Perimeter', 'Solidity'});

% Uncomment the following line to return the properties in a table.
% properties = struct2table(properties);
