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

namespace GadrocsWorkshop.Helios.Gauges.M2000C
{
    using GadrocsWorkshop.Helios.ComponentModel;
    using System.Windows;
    using System.Windows.Media;

    [HeliosControl("HELIOS.M2000C.ParkingBrake_PANEL", "Parking Brake Panel", "M2000C Gauges", typeof(M2000CDeviceRenderer))]
    class M2000C_ParkingBrakePanel : M2000CDevice
    {
        private static readonly Rect SCREEN_RECT = new Rect(0, 0, 56, 350);
        private string _interfaceDeviceName = "Parking Brake Panel";
        private Rect _scaledScreenRect = SCREEN_RECT;
        string _pathToImages = "{M2000C}/Images/Miscellaneous/";

        public M2000C_ParkingBrakePanel()
            : base("Parking Brake Panel", new Size(56, 350))
        {
            AddToggleSwitch("Parking Brake Lever", new Point(0, 0), new Size(56, 350), Controls.ToggleSwitchPosition.One, _pathToImages + "parking-brake-down.png", _pathToImages + "parking-brake-up.png",
                Controls.ToggleSwitchType.OnOn, _interfaceDeviceName, "Parking Brake Lever", false, false);
        }

        #region Properties

        public override string BezelImage
        {
            get { return _pathToImages + "void.png"; }
        }

        #endregion

        protected override void OnPropertyChanged(PropertyNotificationEventArgs args)
        {
            if (args.PropertyName.Equals("Width") || args.PropertyName.Equals("Height"))
            {
                double scaleX = Width / NativeSize.Width;
                double scaleY = Height / NativeSize.Height;
                _scaledScreenRect.Scale(scaleX, scaleY);
            }
            base.OnPropertyChanged(args);
        }

        public override bool HitTest(Point location)
        {
            if (_scaledScreenRect.Contains(location))
            {
                return false;
            }

            return true;
        }

        public override void MouseDown(Point location)
        {
            // No-Op
        }

        public override void MouseDrag(Point location)
        {
            // No-Op
        }

        public override void MouseUp(Point location)
        {
            // No-Op
        }
    }
}