//
//  ViewController.h
//  Created by Gregory Combs on 11/30/11.
//
//  based on work at https://github.com/grgcombs/MultiRowCalloutAnnotationView
//
//  This work is licensed under the Creative Commons Attribution 3.0 Unported License. 
//  To view a copy of this license, visit http://creativecommons.org/licenses/by/3.0/
//  or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
//
//

#import "ViewController.h"
#import "MapCallout.h"
#import "GenericPinAnnotationView.h"
#import "CalloutAnnotationView.h"
#import "CalloutAnnotation.h"
#import "Note.h"
#import "NoteCallout.h"
#import "Photo.h"
#import "PhotoCallout.h"

@interface ViewController()
@property (nonatomic,strong) MKAnnotationView *selectedAnnotationView;
@property (nonatomic,strong) CalloutAnnotation *calloutAnnotation;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Note *note1 = [[Note alloc] initWithTitle:@"Corner Store" content:@"Pick up milk"];
    NoteCallout * noteCallout1 = [[NoteCallout alloc] initWithNote:note1];
    MapCallout * note1Callout = [[MapCallout alloc] initWithCoordinate:CLLocationCoordinate2DMake(35.274722, -97.740556) data:noteCallout1];
    [_mapView addAnnotation:note1Callout];

    Note *note2 = [[Note alloc] initWithTitle:@"Office" content:@"Call John"];
    NoteCallout * noteCallout2 = [[NoteCallout alloc] initWithNote:note2];
    MapCallout * note2Callout = [[MapCallout alloc] initWithCoordinate:CLLocationCoordinate2DMake(35.274722, -107.740556) data:noteCallout2];
    [_mapView addAnnotation:note2Callout];
    
    
    Photo *photo1 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"yellowstone.jpg"]];
    PhotoCallout * photoCallout1 = [[PhotoCallout alloc] initWithPhoto:photo1];
    MapCallout * photo1Callout = [[MapCallout alloc] initWithCoordinate:CLLocationCoordinate2DMake(44.6, -110.5) data:photoCallout1];
    [_mapView addAnnotation:photo1Callout];
    
    Photo *photo2 = [[Photo alloc] initWithImage:[UIImage imageNamed:@"canion.jpg"]];
    PhotoCallout * photoCallout2 = [[PhotoCallout alloc] initWithPhoto:photo2];
    MapCallout * photo2Callout = [[MapCallout alloc] initWithCoordinate:CLLocationCoordinate2DMake(36.1, -112.1) data:photoCallout2];
    [_mapView addAnnotation:photo2Callout];
}

#pragma mark - The Good Stuff

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    if (![annotation conformsToProtocol:@protocol(CalloutAnnotationProtocol)])
        return nil;

    NSObject <CalloutAnnotationProtocol> *newAnnotation = (NSObject <CalloutAnnotationProtocol> *)annotation;
    if (newAnnotation == _calloutAnnotation)
    {
        CalloutAnnotationView *annotationView = (CalloutAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:newAnnotation.calloutType];
        if (!annotationView)
        {
            annotationView = [CalloutAnnotationView calloutWithAnnotation:newAnnotation];
        }
        else
        {
            annotationView.annotation = newAnnotation;
        }
        annotationView.parentAnnotationView = _selectedAnnotationView;
        annotationView.mapView = mapView;
        return annotationView;
    }
    GenericPinAnnotationView *annotationView = (GenericPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:GenericPinReuseIdentifier];
    if (!annotationView)
    {
        annotationView = [GenericPinAnnotationView pinViewWithAnnotation:newAnnotation];
        if ([newAnnotation.calloutType isEqualToString:@"NoteCalloutViewController"]) {
            UIImage * pinImage = [UIImage imageNamed:@"pinRed.png"];
            annotationView.image = pinImage;
        } else {
            UIImage * pinImage = [UIImage imageNamed:@"pinGreen.png"];
            annotationView.image = pinImage;
        }
    }
    annotationView.annotation = newAnnotation;
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)aView
{
    id<MKAnnotation> annotation = aView.annotation;
    if (!annotation || ![aView isSelected])
        return;
    if ( NO == [annotation isKindOfClass:[NoteCalloutViewController class]] &&
        [annotation conformsToProtocol:@protocol(CalloutAnnotationProtocol)])
    {
        NSObject <CalloutAnnotationProtocol> *pinAnnotation = (NSObject <CalloutAnnotationProtocol> *)annotation;
        if (!_calloutAnnotation)
        {
            _calloutAnnotation = [[CalloutAnnotation alloc] init];
            [_calloutAnnotation copyAttributesFromAnnotation:pinAnnotation];
            [mapView addAnnotation:_calloutAnnotation];
        }
        _selectedAnnotationView = aView;
        return;
    }
    [mapView setCenterCoordinate:annotation.coordinate animated:YES];
    _selectedAnnotationView = aView;
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)aView
{
    if ( NO == [aView.annotation conformsToProtocol:@protocol(CalloutAnnotationProtocol)])
        return;
    if ([aView.annotation isKindOfClass:[CalloutAnnotation class]])
        return;
    GenericPinAnnotationView *pinView = (GenericPinAnnotationView *)aView;
    if (_calloutAnnotation && !pinView.preventSelectionChange)
    {
        [mapView removeAnnotation:_calloutAnnotation];
        _calloutAnnotation = nil;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    if (self.isViewLoaded && _mapView && _mapView.annotations)
    {
        [_mapView removeAnnotations:_mapView.annotations];
    }
}

@end
