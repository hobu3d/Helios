﻿//  Copyright 2014 Craig Courtney
//    
//  Helios is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Helios is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.

namespace GadrocsWorkshop.Helios.Gauges.F14B
{
    using GadrocsWorkshop.Helios.ComponentModel;
    using System;
    using System.Globalization;
    using System.Windows;
    using System.Windows.Media;

    class F14BDeviceRenderer : HeliosVisualRenderer
    {
        private ImageBrush _bezel;
        private Rect _bezelRectangle;

        protected override void OnRender(System.Windows.Media.DrawingContext drawingContext)
        {
            F14BDevice _F14Bdevice = Visual as F14BDevice;

            if (_F14Bdevice != null)
            {
                drawingContext.DrawRectangle(_bezel, null, _bezelRectangle);
            }
        }

        protected override void OnRefresh()
        {
            F14BDevice _F14Bdevice = Visual as F14BDevice;

            if (_F14Bdevice != null)
            {
                _bezelRectangle = new Rect(0, 0, _F14Bdevice.Width, _F14Bdevice.Height);

                _bezel = CreateImageBrush(_F14Bdevice.BezelImage);
            }
            else
            {
                _bezel = null;
            }
        }

        private ImageBrush CreateImageBrush(string imagefile)
        {
            ImageSource image = ConfigManager.ImageManager.LoadImage(imagefile);

            if (image != null)
            {
                ImageBrush imageBrush = new ImageBrush(image);
                imageBrush.Stretch = Stretch.Fill;
                imageBrush.TileMode = TileMode.None;
                imageBrush.Viewport = new Rect(0d, 0d, 1d, 1d);
                imageBrush.ViewportUnits = BrushMappingMode.RelativeToBoundingBox;

                return imageBrush;
            }

            return null;
        }
    }
}
