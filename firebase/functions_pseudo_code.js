/**
 * BallotEye Cloud Functions - Pseudo-code for FCM Notifications
 * 
 * This file contains the logic for sending push notifications when 
 * incident reports are updated in Firestore.
 */

const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

/**
 * Trigger: When a report's status is updated.
 * Target: Notify the observer who submitted the report.
 */
exports.onReportStatusChange = functions.firestore
    .document('reports/{reportId}')
    .onUpdate(async (change, context) => {
        const newData = change.after.data();
        const oldData = change.before.data();

        if (newData.status !== oldData.status) {
            const userId = newData.observerId;
            const status = newData.status;

            // Fetch user's FCM token
            const userDoc = await admin.firestore().collection('users').doc(userId).get();
            const fcmToken = userDoc.data()?.fcmToken;

            if (fcmToken) {
                const payload = {
                    notification: {
                        title: 'Report Status Updated',
                        body: `Your report "${newData.title}" is now: ${status.toUpperCase()}`,
                    },
                    data: {
                        reportId: context.params.reportId,
                        type: 'status_update'
                    }
                };

                return admin.messaging().sendToDevice(fcmToken, payload);
            }
        }
    });

/**
 * Trigger: When a report is closed.
 * Target: Notify relevant stakeholders.
 */
exports.onReportClosed = functions.firestore
    .document('reports/{reportId}')
    .onUpdate(async (change, context) => {
        const newData = change.after.data();
        const oldData = change.before.data();

        if (newData.status === 'closed' && oldData.status !== 'closed') {
             // Similar logic to above, notifying the reporter or assigned moderator
             // ...
        }
    });

/**
 * Trigger: New comment added.
 * Target: Notify the reporter or other participants.
 */
exports.onNewComment = functions.firestore
    .document('reports/{reportId}/comments/{commentId}')
    .onCreate(async (snapshot, context) => {
        // Find participants and send notifications
        // ...
    });
