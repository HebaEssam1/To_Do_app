import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/task.dart';

CollectionReference<Task> getTaskCollection(){
  return FirebaseFirestore.instance.collection('task')
      .withConverter(
      fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
      toFirestore: (task, options) => task.toJson());

}
Future<void> addTasktoFireStore(Task task){
  var collection = getTaskCollection();
  var docRef=collection.doc();
  task.id=docRef.id;
  return docRef.set(task);
}
Future<void> DeleteTaskFromFirestore(Task task){
  return getTaskCollection().doc(task.id).delete();
}
